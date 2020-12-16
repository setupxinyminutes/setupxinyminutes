# Setup X in Y Minutes

Like [Learn X in Y minutes](https://learnxinyminutes.com/)
but dealing with the setup of X.

[https://setupxinyminutes.github.io/](https://setupxinyminutes.github.io/)



## Publish new Versions

TODO automate this with github actions

```bash
# Make sure you have both repos
git clone git@github.com:setupxinyminutes/setupxinyminutes.git
git clone git@github.com:setupxinyminutes/setupxinyminutes.github.io.git

cd setupxinyminutes
poetry shell
cd ../setupxinyminutes.github.io
mkdocs gh-deploy --config-file ../setupxinyminutes/mkdocs.yml --remote-branch master
```
