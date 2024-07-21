# Auto-Sublister
**Auto-Sublister** is a bash script tool that automates subdomain enumeration for a list of domains using Sublist3r. It reads domains from an input file, runs Sublist3r for each domain, and aggregates all discovered subdomains into a single output file, providing an efficient and consolidated subdomain discovery process.


## INSTALLATION

OPEN YOUR TERMINAL & RUN THE FOLLOWING COMMANDS

- UPDATE AND UPGRADE YOUR KALI
  
  ```
      $ sudo apt-get update && sudo apt-get upgrade -y
  ```
  
- INSTALL sublist3r 
  
  ```
      $ sudo apt install sublist3r
  ```
  
- CLONE Auto-Sublister IN YOUR TERMINAL

  ```
      $ git clone https://github.com/kalmux1/Auto-Sublister.git
  ```

- CHANGE DIRECTORY INTO Auto-Sublister

  ```
      $  cd Auto-Sublister
  ```

- GIVE EXECUTABLE PERMISSION TO THE BASH FILE
  ```
      $ sudo chmod +x autolister.sh
  ```
- EXECUTE THE SCRIPT

  ```
      $ sudo ./autolister.sh <input file> <outputfile>
  ```

 <pre>    [input file] = Files contains domain names list in txt format
    [output file] = File in which you want all your Subdomains </pre>

  <pre>                                              HAPPY HACKING !</pre>
 
