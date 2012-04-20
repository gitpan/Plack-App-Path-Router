
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A Plack component for dispatching with Path::Router",
  "AUTHOR" => "Stevan Little <stevan.little at iinteractive.com>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Path::Router" => 0,
    "Plack::App::URLMap" => 0,
    "Plack::Middleware::Auth::Basic" => 0,
    "Plack::Test" => 0,
    "Test::More" => "0.88",
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Plack-App-Path-Router",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Plack::App::Path::Router",
  "PREREQ_PM" => {
    "Moose" => "0.90",
    "MooseX::NonMoose" => "0.07",
    "Path::Router" => "0.08",
    "Plack" => "0.9021",
    "Plack::Component" => 0,
    "Plack::Request" => "0.08"
  },
  "VERSION" => "0.05",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



