# .Net Solution Structure


I want something easy that i can just execute and get the folder structure for a given solution, i did some research and found some good articles and i decided to make this repo to help others like me.

The repo is about a script that creates a .Net solution with a useful folder structure and a blank solution just to start adding your projects.


# How to use it

**Windows**

- Download the **DotNetSolution.cmd** file to your repository folder and execute it
- Enter a solution name when requested and hit enter.

The script will create the following structure of folders inside a folder with the given solution name and a blank solution with same name.

Example of solution with the name **NewProject**

![ScreenShot](/docs/images/NewProjectSample.png)
![ScreenShot](/docs/images/NewProjectSampleSrc.png)


Once you open your blank solution and before you add some projects, you could add some `solution folders` to match the folder structure inside the `scr` and  `tests` folder

*Visual Studio with solution folders added*

![ScreenShot](/docs/images/NewProjectSampleVisualStudioFolders.png)


*src folder*

![ScreenShot](/docs/images/NewProjectSampleSrcProjects.png)



# Todo
Create a standar file for each of the following files to download into the solution at the moment of creation
- [x] .gitignore
- [ ] .editorconfig
- [ ] .gitattributes
- [ ] .gitignore
- [ ] build.cmd
- [ ] build.sh
- [ ] Nuget.Config

- [ ] Create a license selector and download selected to the LICENSE solution file
- [ ] Support folder path as parameter or in the solution name



# Reference

Most, if not all, folders are based on the following structure, there you would [find a good explanation of it](https://gist.github.com/davidfowl/ed7564297c61fe9ab814#file-dotnetlayout-md) 

The script downloads the `.gitignore` file fron the [VisualStudio gitignore repo](https://github.com/github/gitignore/blob/master/VisualStudio.gitignore)



# Similar projects found 

Good one with a graphic interface [SolutionGenerator](https://github.com/WildGums/SolutionGenerator)



## Contributing

Want to help me on this, please submit an issue or pull request



