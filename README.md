## add new template
```bash
git init 
git checkout -b xx-template

# create a new template without files
git checkout --orphan xx-template 
git rm -rf .

git add . 
git commit -m "add new template"
# 
git remote add origin git@github.com:Tzlzl12/templates.git
git push -u oringin xx-template
```
## how to use 
```bash
* git clone -b xx-template --single-branch git@github.com:Tzlzl12/templates.git myapp 
* cd mypp
* rm -rf .git
```
