#!/usr/bin/perl
#
#sum spin up/dn wanndos.log to a total wanndos.log
#Usage: sumdos.pl <spin_up_wanndos.log> <spin_dn_wanndos.log> > outputfile

$wanndos_up=$ARGV[0];
$wanndos_dn=$ARGV[1];

open(FILE_up, $wanndos_up);
open(FILE_dn, $wanndos_dn);

$_=<FILE_up>;
$_=<FILE_dn>;
@tmp=split;
while($tmp[0] eq "#"){
	if($tmp[1] ne 'Fermi'){
		printf("$_");
	}	
	$_=<FILE_up>;
	@tmp1=split;
	$_=<FILE_dn>;
	@tmp2=split;
	@tmp=@tmp2;
}
printf("%12.4f %12.9f %12.9f\n",$tmp1[0],$tmp1[1]+$tmp2[1],($tmp1[2]+$tmp2[2])/2);
while($_=<FILE_up>){
	@tmp1=split;
	$_=<FILE_dn>;
	@tmp2=split;
	printf("%12.4f %12.9f %12.9f\n",$tmp1[0],$tmp1[1]+$tmp2[1],($tmp1[2]+$tmp2[2])/2);
}



close(FILE_up);
close(FILE_dn);