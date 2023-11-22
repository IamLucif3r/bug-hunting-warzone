![](assets/banner.gif)
<div align = "center"> <h1> Bug Hunting Warzone   </h1>	
A Dockerfile, pre-loaded with all necessary tools required for bug hunting. :v:
</div>

<br>
<a href=https://twitter.com/IamLucif3r_>
	
<div align = "center">
	
![](https://img.shields.io/twitter/follow/IamLucif3r_?style=social) </a>    <a href=https://github.com/IamLucif3r> ![](https://img.shields.io/github/followers/IamLucif3r?label=Follow%20Me&style=social) </a> </div>


## What is Bug Hunting Warzone ?

The Bug Hunting Warzone is a Dockerfile that provides ready to hunt environment for users. It is a meticulously crafted tool designed to streamline the setup of an efficient bug-hunting environment for cybersecurity professionals. With seamless deployment, users can focus on their core expertise—identifying and mitigating security vulnerabilities.

## Features

- **Effortless Setup:** Deploy a comprehensive bug-hunting environment effortlessly, reducing the time spent on configuration.
- Based on Kali Linux image, giving familiar workspace
- Lightweight and loaded with necessary tools. 
- Allows storing your findings on local, in case you shut down Containner.


## Usage

### 1. By using Git Clone

1. Clone this repository on your local :

```bash
git clone http://www.github.com/IamLucif3r/bug-hunting-warzone.git
```
### 2. Build the Dockerfile

```bash
cd bug-hunting-warzone
sudo docker build -t bug-hunting-warzone .
```
After successfully completion of this process, you will get a Docker Image ready to run. 

### 3. Now time to get to the warzone:

**NOTE:** You can save all your files from Docker Container to your localhost, by mounnting a folder from your local. For e.g. below command will mount `/home/bug-hunt` directory (on the Docker Host) to `/opt` directory in your container. Thus any files added to `/opt` directory will persist in `/home/bug-hunt` directory on your local, once you exit the container. 

```bash
 sudo docker run --privileged -v "/home/bug-hunt:/opt" -it bug-huting-warzone bash
```

4. You have your weapons loaded with you. You can start your hunting. 

## Contribution

All suggestions & contributions to enhance and expand the BHW-Dockerfile are welcome. Feel free to submit pull requests or raise issues on the GitHub repository: [Bug-Hunting-Warzone](https://github.com/IamLucif3r/bug-hunting-warzone) .
