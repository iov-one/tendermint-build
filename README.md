# Tendermint-build
[Gitian](https://gitian.org) base build process for [Tendermint](https://github.com/tendermint/tendermint).

## Trigger new artifact build
1. Update `./build-version.txt` file and set proper tag and commit hash.
2. Create a Pull Request and let Travis CI build it.
3. Merge the Pull Request to master branch and create a tag `BUILD_TAG-iovCOUNTER`, (for example `v0.31.5-iov1`)
   `BUILD_TAG` is the Tendermint tag you are building and the `COUNTER` an IOV counter that you can increase if you have to, to create another build for the same build tag value.
4. Let TravisCI build the tagged version and automatically upload a release artifact to github and docker. 

## Run build and sign it
1. Prepare the environment:
      - `export BUILD_TAG=$(source ./build-version.txt && echo -n $BUILD_TAG)`
      - `export BUILD_COMMIT=$(source ./build-version.txt && echo -n $BUILD_COMMIT)`
2. Ensure [apt-cacher](./contrib/apt-cacher) is running
3. Run build: `./contrib/gitian-build.sh -c  -s YOUR_GPG_KEY_ID linux` (use `gpg -k` for your key list. For example `you@users.noreply.github.com`)
4. Upload signatures via PR 
    - `cd tendermint.sigs`
    - `git checkout -b ${BUILD_TAG}-YOU`
    - `git push --set-upstream origin ${BUILD_TAG}-YOU`
    - `https://github.com/iov-one/tendermint.sigs/pull/new/${BUILD_TAG}-YOU`

## Disclaimer
The build scripts are very much based on the work done by the Cosmos team in https://github.com/cosmos/gaia/tree/master/contrib

## License
Copyright 2019 IOV SAS

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
