## Changelog

### 2015-11-06 (2.2.0)

- Installing customised build of sqlite3
- Updating installed nodejs version to: 0.12
- Controlling nodes using forever-service (replaces cron)
- Installing lisk-node (used as vm for running dapps)
- Restricting installation to Ubuntu Linux only
- Updating app_url and blockchain_url links

***

### 2015-09-16 (2.1.1)

- Ensuring passphrases are never saved in cache.json
- Fixing undefined method error encountered when no accounts are configured
- Fixing error encountered when running automated update script with no ruby installed

***

### 2015-09-15 (2.1.0)

#### Checking Nodes

- Adding timestamp to Last Forged block
- Reformatting Last Forged block to: Amount @ Height -> Timestamp
- Disregarding sync status when inspecting nodes/accounts
- Disabling delegate status when node is loading
- Formatting balance changes to 8 decimal places

#### Start/Stop Forging

- Recursively prompting user for "another" delegate until done
- Escaping grave accents when submitting passphrases

#### Node Installation

- Adding --production switch to node installer
- Scheduling automatic start on server reboot
  - Adding cron job on install, reinstall and rebuild
  - Removing crob job on uninstall

#### Configuration

- Adding configurable genesis block timestamp
- Allowing top accounts to be optionally enabled

#### Updates

- Updating ruby to version: 2.2.3
- Updating byebug and rspec gems
- Updating reference node

***

### 2015-05-19 (2.0.2)

- Fixing broken URLs

***

### 2015-04-10 (2.0.1)

This release fixes some issues affecting certain systems.

- Fixing uninitialized constant LiskRake::BasicError after initial installation
- Fixing bash auto-completion where .profile exists instead of .bash_profile

***

### 2015-04-07 (2.0.0)

- Updating API for compatibility with lisk node version: 0.2.0
- Updating Gemfile with the latest versions for all dependencies
- Fixing error when servers or accounts are not defined within config
- Making forging info mandatory rather than optional (as no need to disable it now)
- Adding support for running multiple delegates on individual nodes
- Adding delegate status information to ```check_nodes``` task
- Changing 'main' app_port from 7040 to 8040
- Reworking ```withdraw_surplus``` task
  - Renamed task to ```withdraw_balances```
  - Now allows users to withdraw specific balance
  - Improved accuracy of network fee deduction
  - User now presented with a list of accounts to withdraw from
  - Recipient address is now specified using ENV[‘recipient’]
  - Improved error and log messages

#### Multiple Delegates

LiskRake now supports running multiple delegates on one node.

For more information, please read:
[https://github.com/LiskHQ/lisk-rake/blob/v2.0.0/README.md#multiple-delegates](https://github.com/LiskHQ/lisk-rake/blob/v2.0.0/README.md#multiple-delegates)

#### Delegate Status

Delegate names, productivity and ranking are now shown when running the ```check_nodes``` task.

For more information, please read:
[https://github.com/LiskHQ/lisk-rake/blob/v2.0.0/README.md#checking-nodes](https://github.com/LiskHQ/lisk-rake/blob/v2.0.0/README.md#checking-nodes)

#### Withdrawals

The ```withdraw_surplus``` task has now been reimplemented as ```withdraw_funds```.

For more information, please read:
[https://github.com/LiskHQ/lisk-rake/blob/v2.0.0/README.md#withdrawals](https://github.com/LiskHQ/lisk-rake/blob/v2.0.0/README.md#withdrawals)

***

### 2015-04-01 (1.9.1)

- Fixing errors encountered when running ```install_nodes``` task

***

### 2015-03-14 (1.9.0)

- Improved ```check_nodes``` task

Now automatically reports outdated nodes with helpful instructions on how to upgrade.

> NOTE: The latest version is determined by sampling the first 100 peers found on the network. This sample data is taken by a designated reference node, as defined within the LiskRake configuration file.

For more information, please read:

[https://github.com/LiskHQ/lisk-rake/blob/v1.9.0/README.md#checking-nodes](https://github.com/LiskHQ/lisk-rake/blob/v1.9.0/README.md#checking-nodes)

- Replacing lisk download url

Now automatically points to latest API compatible lisk version. Removing the need for LiskRake to track every lisk release.

- Replacing blockchain download url

Now points to a more regularly updated blockchain snapshot.

- Improved and refined documentation

Documentation should now be more straight forward for any newcomers.

Please read: [https://github.com/LiskHQ/lisk-rake/blob/v1.9.0/README.md](https://github.com/LiskHQ/lisk-rake/blob/v1.9.0/README.md)

***

### 2015-03-11 (1.8.3)

- Updated lisk node to latest version: 0.1.9f

***

### 2015-03-10 (1.8.2)

- Updated lisk node to latest version: 0.1.9d
- Automatically keeping configured servers/accounts on update
- Backing up config.yml using interactive copy on update

***

### 2015-02-27 (1.8.1)

- Adding ```reinstall_nodes``` task
- Updated lisk node to latest version: 0.1.9c
- Removing application version from install path
- Updating/freshening files upon decompression

#### Reinstall Nodes

The ```reinstall_nodes``` task installs a fresh copy lisk while saving and restoring the existing blockchain. This is useful when you want to update to the latest version of lisk without having to download a new copy of the blockchain.

For reference:

- To install from scratch: ```rake install_all``` or  ```rake install_nodes```
- To install/update and keep the existing blockchain: ```rake reinstall_nodes```
- To replace only the blockchain: ```rake rebuild_nodes```

***

### 2015-01-24 (1.8.0)

This update coincides with the release of Lisk 0.1.9. In addition to the mandatory changes for compatibility with the new Lisk API, it contains numerous bug fixes and improvements to the underlying code.

#### Updates

- Updated lisk node to latest version: 0.1.9
- Improved reporting of block height during loading & syncing
- Allowing blockchain_url to be optionally defined in config.yml
- Removing unnecessary dependency checks from ```check_nodes``` task

#### Bug Fixes

- Improved escaping of passphrases: slashes and single quotes no longer cause errors
- Gracefully handling server connection errors when adding public ssh key to servers
- Gracefully handling network is unreachable server connection errors
- Gracefully handling fingerprint mismatch server connection errors
- Relaxing lisk address validation in withdraw_surplus task
- Preventing forging management until node is loaded
- Preventing surplus withdrawals until node is loaded

***

### 2014-12-18 (1.7.4)

- Adding uptime, cpu & memory usage to the ```check_nodes``` task

  #### Example

  ```rake check_nodes servers=1```

  Which outputs the following for each server:

  ```
  ================================================================================
  Node[1]: 111.11.11.111 (4956977736153893179L)
  ================================================================================
  Usage:             CPU: 27.1% | Memory: 61.7%
  Uptime:            0:1:32:35.744
  ```

- Adding ```download_logs``` task

  #### Example

  ```rake download_logs servers=1```

  Downloads the current forever and lisk log from each server to the local machine.
  Log files are saved into the relative ```logs/``` directory for further analysis, like so:

  ```
  1.forever.log
  1.lisk.log
  ```

  > NOTE: Previous downloads are deleted before each subsequent download.

- Adding ```clean_logs``` task

  #### Example

  ```rake clean_logs servers=1```

  Which does the following on each server:

  - Existing lisk log file is truncated to zero
  - Old lisk log file(s) are removed
  - Old forever log file(s) are removed

***

### 2014-12-15 (1.7.3)

This update coincides with the release of Lisk 0.1.8. The latest version of Lisk adds some welcome stability, quicker load times and more responsive node queries; which all contribute to making node deployment using LiskRake a more pleasant experience.

#### Updates

- Updated lisk node to latest version: 0.1.8
- Adding environment option to config.yml
  - 'main' will deploy nodes onto the main blockchain using port 6040
  - 'test' will deploy nodes onto the test blockchain using port 7040

#### Bug Fixes

- Improved error handling when adding public ssh key to servers
  - Gracefully handling host key verification failures
  - Gracefully handling authentication failures
- Escaping all known reserved characters when saving passphrase to config
- Ensuring json responses are successful rather than merely populated
- Translating nil values encountered when node has just been started

***

### 2014-12-02 (1.7.2)

- Improved ```remove_servers``` command syntax

  #### Example

  You can now use the same targeting syntax as all other tasks.

  - Selection of servers: ```rake remove_servers servers=1,2,3```
  - Range of servers: ```rake remove_servers servers=1..3```
  - All servers: ```rake remove_servers servers=all```

- Highlighting balance changes between the last time the check_nodes task was run

  #### Example

  Applies to all balances generated by the ```check_nodes``` task: Account and Forged balances. Making it much easier to visually track when one of your nodes has forged some coins or their balances have changed in some other way.

  Upon first invocation you will see the following highlighted in blue, which indicates this is the first time you are running the report hence there are no changes:

  <pre><code>Balance:           1344.4791879 0.0 (&#42;)</code></pre>

  When a balance has not changed you will see the following highlighted in yellow:

  <pre><code>Balance:           1344.4791879 0.0 (&#61;)</code></pre>

  When a balance has increased by 100 you will see the following output highlighted in green:

  <pre><code>Balance:           1444.4791879 100.0 (&#43;)</code></pre>

  When a balance has decreased by 100 you will see the following output highlighted in red:

  <pre><code>Balance:           1244.4791879 100.0 (&#45;)</code></pre>

- Adding Generated and Last Generated timestamps to the ```check_nodes``` report summary

  #### Example

  At the bottom of each report summary there are now two timestamps representing the current and previous date & time the ```check_nodes``` task was run at.

  ```
  Generated:         ### 2014-12-02 22:28:33 +0000
  Last Generated:    ### 2014-12-02 21:24:03 +0000
  ```

***

### 2014-11-30 (1.7.1)

- Adding automatic detection of remote server architecture and operating system to the ```install_deps``` task

Instead of specifying your target operating system globally like so:  ```rake install_deps os=ubuntu```. You can now simply execute: ```rake install_deps```. After automatically detecting whether a server has a supported architecture and operating system, LiskRake will then proceed to install the relevant dependencies for the given operating system.

> NOTE: The above changes also apply to the ```rake install_all``` command, which merely executes the ```install_deps``` and ```install_nodes``` commands sequentially using one convenient command.

Unsupported architectures and operating systems will raise an error. For a list of supported hosts and operating systems please see:

[https://github.com/LiskHQ/lisk-rake/blob/v1.7.1/README.md#supported-hosts](https://github.com/LiskHQ/lisk-rake/blob/v1.7.1/README.md#supported-hosts)

- Adding automatic removal of ssh fingerprints from the ~/.ssh/known_hosts file after deleting a server using the ```remove_servers``` task

***

### 2014-11-27 (1.7.0)

- Adding support for deployment to CentOS and Fedora operating systems

For usage instructions please see:
[https://github.com/LiskHQ/lisk-rake/blob/v1.7.0/README.md#typical-usage](https://github.com/LiskHQ/lisk-rake/blob/v1.7.0/README.md#typical-usage)

For available operating systems for each supported host please see:
[https://github.com/LiskHQ/lisk-rake/blob/v1.7.0/README.md#supported-hosts](https://github.com/LiskHQ/lisk-rake/blob/v1.7.0/README.md#supported-hosts)

- Implementing workaround for slow ```check_nodes``` task

Forging status is now checked separately from mining info; Allowing slow /api/getMiningInfo requests to be optionally avoided. Mining info can therefore be disabled permanently through config.yml or optionally at runtime from the command line.

For more information please see:
[https://github.com/LiskHQ/lisk-rake/blob/v1.7.0/README.md#mining-info](https://github.com/LiskHQ/lisk-rake/blob/v1.7.0/README.md#mining-info)

- Downloading zip files to static file names; Allowing app and blockchain urls to be more easily customised without breaking LiskRake

Example config.yml with customised URLs hosted on Dropbox:

```
app_url: https://www.dropbox.com/s/ygjs6wwukj3h3ho/lisk-linux-0.1.7.zip?dl=0
blockchain_url: https://www.dropbox.com/s/rbkx0rtvhp4xxbe/blockchain.db.zip?dl=0
```

***

### 2014-11-26 (1.6.5)

- Officially supporting additional hosts: Vultr and Wable
  - Tested on: Debian 7.0 x64 and Ubuntu 14.04 x64 operating systems
- Downloading GPG public key before installing or updating rvm

For more information regarding supported hosts see:
[https://github.com/LiskHQ/lisk-rake/blob/v1.6.5/README.md#supported-hosts](https://github.com/LiskHQ/lisk-rake/blob/v1.6.5/README.md#supported-hosts)

***

### 2014-11-25 (1.6.4)

- Copying rather than moving config.yml when updating LiskRake
- Escaping forward slash character when saving passphrase to config.json
- Adding connection and operation timeouts to curl requests
  - 30 seconds until connection to lisk node times out
  - 60 seconds until lisk API query times out
- Gracefully handling (CTRL+C) user interrupts

***

### 2014-10-24 (1.6.3)

- Reporting when nodes are being synchronised
- Optionally adding passphrase to remote server when starting to forge
- Stating more clearly when forging has been successfully enabled or disabled

For more information see:
[https://github.com/LiskHQ/lisk-rake/blob/v1.6.3/README.md#typical-usage](https://github.com/LiskHQ/lisk-rake/blob/v1.6.3/README.md#typical-usage)

***

### 2014-10-21 (1.6.2)

Fixed some issues I encountered when running the ```check_nodes``` task.

- Node's sync status is now checked before querying mining info or account balances
- Added warning message when a node's blockchain is still being loaded

***

### 2014-10-20 (1.6.1)

- Fixed network fee calculation:  
  Surplus withdrawals should now consistently leave a minimum of 1000 LISK plus some dust
- Allowing withdrawal / deposit address to be specified from the command line. For example:  
  ```rake withdraw_surplus address=4956977736153893179L```
- Re-factored number handling for better accuracy

***

### 2014-10-18 (1.6.0)

- Added ```withdraw_surplus``` task

The ```withdraw_surplus``` task withdraws any surplus balance above the minimum 1000 LISK required to start forging, to a designated lisk account.

Instructions for this new task are available here:
[https://github.com/LiskHQ/lisk-rake/blob/v1.6.0/README.md#surplus-withdrawals](https://github.com/LiskHQ/lisk-rake/blob/v1.6.0/README.md#surplus-withdrawals)

***

### 2014-10-12 (1.5.1)

This update coincides with the release of Lisk 0.1.7. It contains some important bug fixes, improvements to the installation process and a general refactoring of the code base.

#### Updates

- Updated lisk node to latest version: 0.1.7
- Updated blockchain download url

#### Bug Fixes

- Fixed targeting of servers when a range is provided
- Fixed checking of remote dependencies when lisk node has not been installed yet
- When running the automated update script:
  - Latest stable release of rvm is installed
  - Gems are updated and old versions removed
  - CrypiKit gemset is recreated if missing

#### Auto-completion

- Moved bash auto-completion script to bin/completer.rb

On existing installations, please run the following command to re-enable bash auto-completion:

```
ruby bin/completer.rb --re-enable
```

***

### 2014-09-29 (1.5.0)

- Implemented optional bash auto-completion of tasks
- Added more options for targeting servers:
  - All servers via: ```rake command servers=all```
  - Range of servers via: ```rake command servers=5..10```
  - Selection of servers via: ```rake command servers=1,3,7``` (as before)
  - When no servers are provided. Prompting user for y/n answer to run task on all servers
- Added ```install_all``` task to install both dependencies & lisk nodes using one command
- Dependency errors are now handled like connection errors and are included in the report summary
- Dependencies are now stated as they are found on local/remote system
- Stopped install.sh script forking a new shell on installation

***

### 2014-09-24 (1.4.0)

> NOTE: Config file update required. Please run the ```start_forging``` task on all of your nodes after downloading this release. This is due to an API key that needs to be added to the config, before forging statistics can be successfully retrieved.

#### Bug Fixes

- Resolved issue when installing on servers where nodejs already installed
- Ensuring all existing processes are stopped before starting a node
- Checking lisk node is installed before executing certain tasks
- Removing blockchain.db.zip after decompressing it during tasks

#### Features / Improvements

- Added forging information to ```check_nodes``` task including:
  - Forged coins by each individual node
  - Last forged block by each individual node
  - Total forged for all selected nodes
- Graceful handling of common ssh connection errors
- Listing bad nodes at end of ```check_nodes``` report summary
- More consistent, easier to read, colorized log messages

***

### 2014-09-22 (1.3.1)

- Fixed installation issue when installing rvm as root
- Fixed issue with updating of git tree to latest release tag
- Locked ruby installation to version: 2.1.2 (for now)

***

### 2014-09-22 (1.3.0)

- Added detailed report summary to ```check_nodes``` task
- Decompressing new blockchain.db.zip file after download
- Node keys now start at 1 instead of 0 for easier referencing
- Improved handling of empty JSON responses
- Improved error handling of failed API calls

***

### 2014-09-19 (1.2.0)

- Replaced ```get_loading```, ```get_forging``` and ```get_balances``` with single ```check_nodes``` task
- Implemented dependency checks on local/remote machines before executing tasks
- Removing orphan accounts when saving server list

***

### 2014-09-18 (1.1.3)

- Added ```get_balances``` task
- Prettified output of ```get_loading```, ```get_forging``` and ```get_balances``` tasks

***

### 2014-09-17 (1.1.2)

- Added ```log_into``` task for logging into servers directly
- Fixed ```rebuild_nodes``` task: old blockchain is now deleted properly
- Fixed automated update script: now checks out the latest release tag

***

### 2014-09-16 (1.1.1)

- Gracefully handling required password change on Digital Ocean droplets
- Reindexing server list after deleting servers to maintain sane key order

***

### 2014-09-16 (1.1.0)

- Added ```list_servers``` task
- Added ```add_servers``` / ```remove_servers``` tasks
- Added automated update script to get the latest LiskRake release

***

### 2014-09-15 (1.0.0)

- Added ```rebuild_nodes``` task to rebuild nodes using new blockchain only
- Added ```start_forging``` / ```stop_forging``` tasks to enable and disable forging
- Added ```get_forging``` task to verify forging status of each node

***

### 2014-09-13

- Added automated install script to ease installation of LiskRake
- Added ability to target individual servers with each command
- Added ```add_key``` task to upload public ssh key to each server
- Added ```restart_nodes``` task

***

### 2014-09-12

- Initial release
