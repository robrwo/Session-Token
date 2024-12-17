use 5.008;
use strict;

use ExtUtils::MakeMaker;

my %deps = (
  'Crypt::URandom' => '0.37',
);

my %args = (
    NAME              => 'Session::Token',
    VERSION_FROM      => 'lib/Session/Token.pm',
    PREREQ_PM         => \%deps,
    LIBS              => [''],
    DEFINE            => '',
    INC               => '-I.',
    OBJECT            => 'Token.o randport.o',
    LICENSE           => 'perl',
    dist => {
      PREOP => 'pod2text $(VERSION_FROM) > $(DISTVNAME)/README',
    },
    MIN_PERL_VERSION  => '5.6.0',
);


my $eummv = eval ($ExtUtils::MakeMaker::VERSION);
if ($eummv >= 6.45) {
    $args{META_MERGE} = {
        resources => {
            repository => 'git://github.com/hoytech/Session-Token.git',
            bugtracker => 'https://github.com/hoytech/Session-Token/issues',
        },
    };
}

WriteMakefile(%args);
