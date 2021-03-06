# site_aws_circleci [![serhiiKalchenko](https://circleci.com/gh/serhiiKalchenko/site_aws_circleci.svg?style=svg)](https://app.circleci.com/pipelines/github/serhiiKalchenko/site_aws_circleci)

The CI/CD Project!

Deploy site on Joomla using CircleCI!

## Task Lists
- [x] one command with parameter
- [x] one executor with parameter
- [x] one job with parameter
- [x] one global (pipeline) parameter

## Pipeline:
1. Checkout (git clone) the code to CircleCI environment.
2. Connecting & transfering package to AWS EC2 instance.
3. Running the site on AWS EC2 instance!

## What you should to do as a DevOps engineer?
1. Launch EC2 instance
2. Install required software:
    * docker
    * docker-compose
3. Configure AWS instance
   * Create a 'user' with 'sudo no:password' priveleges (in my case 'user'=dockeradmin)
4. Generate SSH keys (private, public)
   * copy rsa.pub into 'user'/.ssh/authorized_keys
5. CircleCI ('Project Settings'):
   * Add host (public dns name of EC2 instance) and private SSH key for it.
6. Do an **Initial launch** the site as described in [Issue #1](https://github.com/serhiiKalchenko/site_aws_circleci/issues/1)
  

## Some features of the projects & suggestions
  * all permissions and ownership in archive `joomla-data.tar.bz2` are preserved, 
  * so you should work with git as `sudo` (sudo git add, commit, push...)
  * you can make an alias in bash:
  	* nano ~/.bashrc; alias gitpush='git commit -a -m "update..." ; git push origin main'

## Site configuration & credentials:
    * credentials for site administration (http://your_ip_address/administrator): admin/admin
    * credentials for db access are in `docker-compose.yml`
    * The site (CMS Joomla) is absolutely clean, after installation as is
    * Dir sample/ - just sample of html-pages
	
## .circleci
I have different versions of config.yml for better understanding in educational purposes.
  * config.yml.v1 - simplest (straightforward) config
  * config.yml - config with using 'parameters'
  * All configs are working!;)

### Have a question or feedback?
 * please open an Issue in this repository:wink:

### Have fun!:hugs:


