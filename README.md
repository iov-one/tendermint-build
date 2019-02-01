## Tendermint-build container
Containerized build environemnt to create the docker artifact: 
https://hub.docker.com/r/iov1/tendermint

### Development

```
docker build --pull --no-cache -t v0.29.1 --build-arg source_version=v0.29.1 --build-arg source_repo=github.com/tendermint/tendermint .
```

* ` --no-cache` to not cache the code during checkout step


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
