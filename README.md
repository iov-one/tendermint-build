## Tendermint-build
[Gitian](https://gitian.org) base build process for [Tendermint](https://github.com/tendermint/tendermint).

#### Trigger new artifact build
1. Update `./build-version.txt` file and set proper tag and commit hash.
2. Do PR and let travisCI build it.
3. Merge to master and Tag with `v0.31.5-iov1`. The first part is the Tendermint tag you are building and the second a iov counter that you can increase if you have to.
4. Let TravisCI build the tagged version and automatically upload a release artifact to github and docker. 

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
