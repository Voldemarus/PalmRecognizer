#!/usr/bin/perl

#  GenerateImageSet.pl
#  PalmRecognizer
#
#  Created by Водолазкий В.В. on 22/05/2019.
#  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.

#
# Script used to parse directory with hierarchy of images to be tested
# and to create appropriate ImageList+ImageDataList.m file
#

use Data::Dumper;

#destination file
my $outFileName = "ImageList+ImageDataList.m";
#folder with images inside Project DIR
my $imageSetDirectory = "ImageSet";
#folder name where templates are stored
my $templatesDirectory = "Templates";


my ($projectDir) = @ARGV;
if (defined($projectDir)) {
	$classDir = $projectDir."/PalmRecognizer";
	opendir (DIR, $classDir) or die "unable to open $projectDir -> $!\n";
	# look for an image set directory
	my $size = @files2 = grep {/^$imageSetDirectory$/} readdir DIR;
	closedir DIR;
	if ($size > 0) {
		# proper directory found
		my $imageDir = $classDir."/".$imageSetDirectory;
		opendir (IMDIR,$imageDir) or die "Cannot open $imageSetDirectory -> $!";
		# search for templates
		my @imDirs = readdir IMDIR;
		print "omDirs ".Dumper(\@imDirs);
		my $templateDir = $imageDir."/".$templatesDirectory;
		print "Templat directory - $templateDir \n";
		opendir (TEMPLATEDIR, $templateDir) || die "Cannot open template directory - $!";
		my @templates = grep {/^.+\.jpg$/} readdir TEMPLATEDIR;
		#
		# fill array with template' filenames
		#
		
		
		print "templates ".Dumper(\@templates);

	}
	
	print "files - ".Dumper(\@files2);
	
} else {
	print "PROJECT_DIR should be used as command line argument\n";
	exit 1;
}



exit 1;
