#!/bin/bash


Cyan='\033[0;36m'
Default='\033[0;m'

projectName=""
httpsRepo=""
sshRepo=""
homePage=""
authorName=""
confirmed="n"

getProjectName() {
    read -p "请输入项目名: " projectName

    if test -z "$projectName"; then
        getProjectName
    fi
}

getHTTPSRepo() {
    read -p "请输入仓库HTTPS URL: " httpsRepo

    if test -z "$httpsRepo"; then
        getHTTPSRepo
    fi
}

getSSHRepo() {
    read -p "请输入仓库SSH URL: " sshRepo

    if test -z "$sshRepo"; then
        getSSHRepo
    fi
}

getHomePage() {
    read -p "请输入主页 URL: " homePage

    if test -z "$homePage"; then
        getHomePage
    fi
}

getAuthorName() {
read -p "请输入作者名: " authorName

if test -z "$authorName"; then
getAuthorName
fi
}


getInfomation() {
    getProjectName
    getAuthorName
    getHomePage
    getSSHRepo
    getHTTPSRepo


    echo -e "\n${Default}================================================"
    echo -e "  Project Name  :  ${Cyan}${projectName}${Default}"
    echo -e "  HTTPS Repo    :  ${Cyan}${httpsRepo}${Default}"
    echo -e "  SSH Repo      :  ${Cyan}${sshRepo}${Default}"
    echo -e "  Home Page URL :  ${Cyan}${homePage}${Default}"
    echo -e "  Author Name   :  ${Cyan}${authorName}${Default}"
    echo -e "================================================\n"
}



echo -e "\n"
while [ "$confirmed" != "y" -a "$confirmed" != "Y" ]
do
    if [ "$confirmed" == "n" -o "$confirmed" == "N" ]; then
        getInfomation
    fi
    read -p "confirm? (y/n):" confirmed
done

pod lib create ${projectName}

# 获取当前执行脚本的父目录
dir=$(dirname $0)
# 进入父目录并打印路径
currentDir=$(cd $dir; pwd)

echo "当前目录 ${currentDir}"

 mv "${currentDir}/${projectName}" "${currentDir}/../${projectName}"

mkdir -p "../${projectName}/${projectName}"

licenseFilePath="../${projectName}/FILE_LICENSE"
gitignoreFilePath="../${projectName}/.gitignore"
specFilePath="../${projectName}/${projectName}.podspec"
uploadFilePath="../${projectName}/upload.sh"
swiftVerisonFilePath="../${projectName}/.swift-version"
podfilePath="../${projectName}/Example/Podfile"

echo "copy to $licenseFilePath"
cp -f ./templates/FILE_LICENSE "$licenseFilePath"
echo "copy to $gitignoreFilePath"
cp -f ./templates/gitignore    "$gitignoreFilePath"
echo "copy to $specFilePath"
cp -f ./templates/pod.podspec  "$specFilePath"
echo "copy to $uploadFilePath"
cp -f ./templates/upload.sh    "$uploadFilePath"
echo "copy to $swiftVerisonFilePath"
cp -f ./templates/.swift-version       "$swiftVerisonFilePath"
echo "copy to $podfilePath"
cp -f ./templates/Podfile      "$podfilePath"

echo "editing..."
sed -i "" "s%__ProjectName__%${projectName}%g" "$gitignoreFilePath"
sed -i "" "s%__ProjectName__%${projectName}%g" "$uploadFilePath"
sed -i "" "s%__ProjectName__%${projectName}%g" "$swiftVerisonFilePath"
sed -i "" "s%__ProjectName__%${projectName}%g" "$podfilePath"

sed -i "" "s%__ProjectName__%${projectName}%g"      "$specFilePath"
sed -i "" "s%__HomePage__%${homePage}%g"            "$specFilePath"
sed -i "" "s%__HTTPSRepo__%${httpsRepo}%g"          "$specFilePath"
sed -i "" "s%__Author__%${authorName}%g"        "$specFilePath"
sed -i "" "s%__SSHRepo__%${sshRepo}%g"        "$specFilePath"

cat "$specFilePath"

echo "edit finished"

echo "cleaning..."
cd ../$projectName
git init
git remote add origin $httpsRepo  &> /dev/null
git rm -rf --cached ./Pods/     &> /dev/null
git rm --cached Podfile.lock    &> /dev/null
git rm --cached .DS_Store       &> /dev/null
git rm -rf --cached $projectName.xcworkspace/           &> /dev/null
git rm -rf --cached $projectName.xcodeproj/xcuserdata/`whoami`.xcuserdatad/xcschemes/$projectName.xcscheme &> /dev/null
git rm -rf --cached $projectName.xcodeproj/project.xcworkspace/xcuserdata/ &> /dev/null
echo "clean finished"
say "finished"
echo "finished"
