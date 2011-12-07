OmniAuth LinuxFr.org
====================

This is the official OmniAuth strategy for authenticating to LinuxFr.org.
To use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [LinuxFr.org Applications Page](https://linuxfr.org/account/applications).


Basic Usage
-----------

    use OmniAuth::Builder do
      provider :linuxfr, ENV['LINUXFR_KEY'], ENV['LINUXFR_SECRET']
    end


Copyright
---------

The code is licensed as MIT. See the MIT-LICENSE file for the full license.

♡2011 by Bruno Michel. Copying is an act of love. Please copy and share.
