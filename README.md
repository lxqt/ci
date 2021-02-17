# Description

Common scripts for continuous integration of LXQt projects.

# Usage

LXQt projects uses GitHub Actions for CI. To use scripts from this repository, add the following step to `.github/workflows/test.yml` of each project.

```yaml
    - name: Checkout shared CI repo
      uses: actions/checkout@v2
      with:
        repository: lxqt/ci
        path: shared-ci
```

And then source common scripts in the build script `.ci/build.sh` for each project.

```sh
source shared-ci/prepare-archlinux.sh
```
