# 项目配置文件
### Usage

- 1、 使用`pod lib create`方法创建私有库
- 2、 将此库拷贝到创建的私有库的同级目录下

	+ 比如我们创建了`Test`私有库，正确的配置文件结构如下：

		```
		File
		├── configPrivatePod
		├── Test
		├── ...
		```

- 3、 命令行cd到`configPrivatePod `文件夹，执行：`./config.sh`，根据提示进行配置

	+ PS:  注意项目名要和需要配置的库名字一直，比如此处是`Test`。
	+ PS:  需要建立远程库时，去创建远程库再回来填写即可

- 4、 修改完私有库，需要推送到本地和远程pod索引库的时候，cd到`Test`文件下，执行`./upload.sh`，根据提示输入即可



PS: 如果本地私有库索引名字与`upload.sh`文件内名字不一直，需要手动修改`upload.sh`里面的最后的`Specs`为你本地的私有`podspec`库名，使用`pod repo`命令即可查看
