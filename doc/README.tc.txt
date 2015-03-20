####################################################
# tux2live : Your linux live CD builder
#
# Description: To build a live CD for your Linux distribution from hard disk environment
# Last update :
# Author:
#	Ceasar Sun <ceasar_at_nchc_org_tw>
#	Steven Shiau <steven_at_nchc_org_tw>
#
#	Free Software Lab, NCHC, Taiwan
# License: GPL
####################################################

###  Welcome to read tux2live README document ###

Tux2live:
	A toolkit to build your linux environemtn from harddisk into live CD.
	http://drbl.nchc.org.tw/tux2live

System reuqired pacjage:
	Commands:
		rsync
		squashfs-tools
		mkiso
	Kernel modules:
		squashfs module
		unionfs or dm_snapshot module

	Note: You can run './tux2live -c' to identify what packages are lack of

Usage:
	./tux2live --help
	( Display help message )
	./tux2live [-c|--checkenv]
	( Only check if system be prepared all necessary component for tux2live )
	./tux2live -b
	( Batch mode)
	./tux2live -b --tmpdir /mnt/large_space/tmp --outputdir /mnt/large_space/output -I user01
	(  Assign tmp and output dir for tux2live, run in batch mode  and import user01 data in livec CD )
	./tux2live -b --mkrootfs --mkiso -o my-tux2live-cd.iso
	( Only rebuild root filesystem for live CD and re-create iso file named my-tux2live-cd.iso )

Support Linux distro (Tested fine):
	Debian base:
		Debian : etch
		Ubuntu : (6.06, Dapper Drake), （6.10, Edgy Eft）, （7.04, Feisty Fwan）

	RH/MDK like:
		RH like : Fedora core 6, Centos 5, 
		Mandriva: Mandriva 2007, Mandriva 2007.1

	Suse:
		Not yet !!

Contact:
	Ceasar Sun <ceasar at nchc org tw>
	Steven Shiau <steven at nchc org tw>

####################################################
#
#	Free Software Lab, NCHC, Taiwan
# 
####################################################

