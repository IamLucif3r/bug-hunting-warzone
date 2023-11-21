# Bug Bounty Warzone

A Dockerfile, pre-loaded with all necessary tools required for bug hunting. 

## Usage

### 1. By using Git Clone

1. Clone this repository on your local :

```bash
git clone http://www.github.com/IamLucif3r/bug-bounty-warzone.git
```
2. Build the Dockerfile

```bash
cd bug-bounty-warzone
sudo docker build -t bug-bounty-warzone .
```
After successfully completion of this process, you will get a Docker Image ready to run. 

3. Now time to get to the warzone:

```bash
sudo docker run -it bug-bounty-warzone bash
```

4. You have your weapons loaded with you. You can start your hunting. 