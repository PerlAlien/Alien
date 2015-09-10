use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Alien',
  VERSION_FROM => 'lib/Alien.pm',
  AUTHOR       => [ 'Artur Bergman <abergman@cpan.org>', 'Graham Ollis <plicease@cpan.org>' ],
  LICENSE      => 'perl',
  META_MERGE => {
    'meta-spec' => { version => 2 },
    resources => {
      bugtracker => {
        web  => 'https://github.com/Perl5-Alien/Alien/issues',
      },
      homepage => 'https://metacpan.org/pod/Alien',
      repository => {
        type => 'git',
        url  => 'https://github.com/perl5-Alien/Alien.git',
        web  => 'https://github.com/Perl5-Alien/Alien',
      },
    },
    provides => {
      Alien => {
        file    => "lib/Alien.pm",
        version => eval { require "lib/Alien.pm"; $Alien::VERSION; },
      },
    },
  },
);
