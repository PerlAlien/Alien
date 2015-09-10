package Alien;

use strict;
use vars qw($VERSION);
$VERSION = 0.92;

=head1 NAME

Alien - External libraries wrapped up for your viewing pleasure!

=head1 SYNOPSIS

 perldoc Alien;

=head1 DESCRIPTION

Alien is a package that exists just to hold together an idea, the idea
of Alien:: packages, so there is no code here, just motivation for Alien.

The intent of Alien is to provide a mechanism for specifying and installing
non-native dependencies on CPAN.  Frequently, this is a C library used
by XS, but it could be anything non-Perl usable from Perl.  Typical
characteristics of an Alien distribution include:

=over 4

=item Probe for or install library during the build process

Usually this means that L<Module::Build> or L<ExtUtils::MakeMaker> will
probe for an existing system library that meets the criteria of the
Alien module.  If it cannot be found the library is downloaded from
the Internet and installed into a share directory (See L<File::ShareDir>).

Usually, though not necessarily, this is a C library.  It could be
anything though, some JavaScript, Java C<.class> files.  Anything imaginable.

=item The module itself provides attributes needed to use the library

This means that if you are writing C<Alien::Foo> it will provide class
or member functions that will provide the necessary information for using
the library that was probed for or installed during the previous step.

If, for example, C<Alien::Foo> were providing a dependency on the C
library C<libfoo>, then you might provide C<Alien::Foo-E<gt>cflags>
and C<Alien::Foo-E<gt>libs> class methods to return the compiler and
library flags required for using the library.

=back

These are suggestions only, and this module does not provide a framework,
because the needs of an non-native dependency on CPAN are potentially
quite diverse.  That being said, if your library uses a standard build
system, like C<autoconf>, C<make> or C<CMake> you should consider using
L<Alien::Base> which makes it easy to write L<Alien> modules many common
types of package build systems.

=head1 CAVEATS

This section contains some recommendations from my own experience in
writing L<Alien> modules and from working on the L<Alien::Base> team.

=over 4

=item When building from source code, build static libraries whenever possible

Or at least isolate the dynamic libraries so they can be used by FFI,
but do not use them to build XS modules.  The reason for this is that
if an end user upgrades their version of C<Alien::Foo> it may break
the already installed version of C<Foo::XS> that uses it.

=item On Windows (ActiveState, Strawberry Perl)

Many open source libraries use C<autoconf> and other Unix focused tools
that may not be easily available on the native (non-Cygwin) windows Perl.
L<Alien::MSYS> provides just enough of these tools for C<autoconf> and
may be sufficient for some other build tools.  Also, L<Alien::Base>
has hooks to detect C<autoconf> and inject L<Alien::MSYS> as a requirement
on Windows when it is needed.

=back

=head1 ORIGINAL MANIFESTO

What follows is the original L<Alien> manifesto written by Artur Bergman.
It is included here, because much of it is still largely true today,
but it was out of necessity quite aspirational at the time it was written.

=head2 Why

James and I ended up doing a build
system for Fotango, lots of people
have done a build system, it is a pretty boring task. The boring task
is really all the mindlessly stupid things you need to do to build C
libraries that Perl modules require, these C modules usually have
unusual installation systems or require vastly different options. So
CPAN modules install easy, 3rd party stuff is nasty.

So, suddenly an idea struck me, Alien packages! Imagine a CPAN module
that has as its only task to make sure a certain library is
installed! That means that you can write all the voodoo in your
Build.PL file and then just make sure the module requires the correct
Alien module! Then anything that install Perl modules will deal with
it automatically!

=head2 How

So, what should an Alien module do? It should make sure that the
target is installed and it should provide the caller with enough
information to use it.

The idea is that you use it to make sure it is there, and you call
class methods to find out what to use. These class methods will be
individually specified by the stand alone Alien modules.

=head2 No Framework!

The reason this is so loosely worded is because we have no idea what
common functionality will be needed, so we will let evolution work for
us and see what individual Alien packages need and then eventually
factor it out into this packages. I would like to avoid a top down
design approach.

=head2 Responsibilities of a Alien module.

On installation, make sure the required package is there, otherwise install it.

On usage, make sure the required package is there, else croak.

Bundle the source with the module, or download it.

Allow module authors to access information it gathers.

Document itself well.

Be sane.

=head1 SUPPORT

No support needed.

=head1 AUTHOR

=over 4

=item Arthur Bergman <abergman@fotango.com>

=item Graham Ollis <plicease@cpan.org>

=back

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=head1 SEE ALSO

=over 4

=item L<Alien::Base>

An (optional) base class and framework for creating L<Alien> distributions.

=item L<Alien::Base::FAQ>

Frequently Asked Questions for L<Alien::Base>.  Mostly specific to L<Alien::Base>,
but also addresses some challenges for L<Alien> in general.

=item L<#native on irc.perl.org|http://chat.mibbit.com/#native@irc.perl.org>

This channel on IRC is dedicated to those interested in using native interfaces
in Perl.  It is specifically geared to L<Alien>, L<Alien::Base> and FFI.

=item L<Perl5 Alien mailing list|https://groups.google.com/forum/#!forum/perl5-alien>

This mailing list is mainly for L<Alien::Base>, and announcements for new
versions will be posted there, but general L<Alien> inquires are also welcome.

=back

=cut

1;
__END__

