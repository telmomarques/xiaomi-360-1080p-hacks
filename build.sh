#!/bin/bash

github_download_release_asset() {
  local owner=$1
  local repository=$2
  local tagName=$3
  local assetName=$4
  local destPath=$5

  local query="{ \
    \"query\": \" \
      query { \
        repository(owner:\\\"${owner}\\\" name:\\\"${repository}\\\") { \
          release(tagName:\\\"${tagName}\\\") { \
            releaseAssets(name:\\\"${assetName}\\\" first:1) { \
              edges { \
                node { \
                  downloadUrl \
                } \
              } \
            } \
          } \
        } \
      } \
    \"} \
  "

  curl -s -H "Authorization: bearer db810166f48289029e1cd378b4d632c8a5899ecd" -X POST -d "${query}" https://api.github.com/graphql |
  jq -r ".data.repository.release.releaseAssets.edges[0].node.downloadUrl" |
  xargs wget -q --show-progress -P ${destPath}
}

download_from_url()
{
  local url=$1
  local destPath=$2

  wget -q --show-progress -O "${destPath}" ${url}
}

process_external_download()
{
  local url=$1
  local filename=$2
  local destPath=$3
  local destFilename=${destPath}/${filename}

  echo Downloading \"${url}\" to \"${destFilename}\"

  download_from_url ${url} ${destFilename}
}

process_github_release_asset_download()
{
  local owner=$1
  local repository=$2
  local tagName="latest-rc"
  local assetName=$3
  local destPath=$4

  echo Downloading \"${owner}/${repository}@${tagName}/${assetName}\" to \"${destPath}/$assetName\"

  github_download_release_asset ${owner} ${repository} ${tagName} ${assetName} ${destPath}
}

extract_zip()
{
  zipFile=$1

  echo Extracting ${zipFile}

  unzip -qq ${zipFile} -d `dirname ${zipFile}`
  rm -f ${zipFile}
}

process_build_file()
{
  local buildFilePath=$1
  local source=`cat ${buildFilePath} | jq -r ".source"`
  local destinationPath=`dirname ${buildFilePath}`
  local assetFilename=""
  
  if [ "${source}" == "external" ]; then
    local url=`cat ${buildFilePath} | jq -r ".url"`
    assetFilename=`cat ${buildFilePath} | jq -r ".filename"`
    process_external_download ${url} ${assetFilename} ${destinationPath}

  elif [ "${source}" == "github-release-asset" ]; then
    local owner=`cat ${buildFilePath} | jq -r ".owner"`
    local repository=`cat ${buildFilePath} | jq -r ".repository"`
    assetFilename=`cat ${buildFilePath} | jq -r ".assetName"`
    process_github_release_asset_download ${owner} ${repository} ${assetFilename} ${destinationPath}
  fi

  if [ ! -z "${assetFilename}" ]; then
    local assetFileExtension="${assetFilename##*.}"

    if [ "${assetFileExtension}" == "zip" ]; then
      extract_zip ${destinationPath}/${assetFilename}
    fi
  fi
}

clean_directory()
{
  local directory=$1
  echo "Cleaning ${directory}"
  find ${directory} -mindepth 1 ! -name '.build' -exec rm -rf {} +
}

clean()
{
  echo "Cleaning..."

  shopt -s globstar
  for buildFile in ./**/.build
  do
    clean_directory `dirname ${buildFile}`
  done

  echo "Cleaning package"
  rm -f sdcard.zip
}

build()
{
  echo "Building..."

  shopt -s globstar
  for buildFile in ./**/.build
  do
    process_build_file ${buildFile}
  done
}

package()
{
  zip -r sdcard.zip sdcard -x sdcard/**/.build
}

main()
{
  local target=$1

  case ${target} in
    clean)
      clean
    ;;

    rc)
      release=$2
      cameraModel=$3

      clean
      build
      package
    ;;
  esac
}

main $1