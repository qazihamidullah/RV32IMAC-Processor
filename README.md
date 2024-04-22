# rv_core

Folder structure is as follows

* design
  * core
  * uncore
    * uart
    * timer
  * soc_top
  * ips
* verif
  * dv_tests
    * rv_"arch"
  * uvm
* fpga
  * de1soc
* software

Instructions for contributing to the repo.
1. Every member will do his development in branch with the naming convetion user_dev_feature
    * where "feature" is the feature of the core he is working 
2. After feature developments is complete
    * design needs to be tested aganist the test cases for the respective feature by designer
    * designed needs to be verified by the uvm framework by the verif team member.
    * after reviewing the results of verification and if results are statisfactory then pull request will be generate for the brach to merge into main.
    * if results are not statisfactory, feedback wil be given to designer and/or verification team for improvement
3. main repo at any time will contain the most recent verified code and is not accessble for anyone except for repo admin to make commits or any other changes.
    * changes to main branch can only be done by a pull request 
    * every member need to follow given below steps to make pushing and commiting to main locked on you machine. 
      1. Copy the pre-push and pre-commit files into your repo `.git/hooks/`
      2. Set executable permissions, run `chmod +x .git/hooks/pre-push` and `chmod +x .git/hooks/pre-commit`
4. different tags with naming convetion "rv_core_feature" will used to represent sort of a snapshots of main branch at different time with verified version of the core with that feature

