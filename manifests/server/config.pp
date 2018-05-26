# Class: ssh::server::config
#
# Provide the configuration parameters necessary to configure sshd(8)
# through sshd_config(5) from a template.
#
class ssh::server::config (
  $acceptenv                       = undef,
  $addressfamily                   = undef,
  $allowagentforwarding            = undef,
  $allowtcpforwarding              = undef,
  $allowusers                      = undef,
  $authenticationmethods           = undef,
  $authorizedkeyscommand           = undef,
  $authorizedkeyscommanduser       = undef,
  $authorizedkeysfile              = undef,
  $authorizedprincipalsfile        = undef,
  $banner                          = undef,
  $challengeresponseauthentication = undef,
  $chrootdirectory                 = undef,
  $ciphers                         = undef,
  $clientalivecountmax             = undef,
  $clientaliveinterval             = undef,
  $compression                     = undef,
  $denygroups                      = undef,
  $denyusers                       = undef,
  $exposeauthinfo                  = undef,
  $forcecommand                    = undef,
  $gatewayports                    = undef,
  $gssapiauthentication            = undef,
  $gssapikeyexchange               = undef,
  $gssapicleanupcredentials        = undef,
  $gssapistorecredentialsonrekey   = undef,
  $gssapistrictacceptorcheck       = undef,
  $hostbasedauthentication         = undef,
  $hostbasedusesnamefrompacketonly = undef,
  $hostcertificate                 = undef,
  $hostkeyalgorithms               = undef,
  $hostkey                         = undef,
  $ignorerhosts                    = undef,
  $ignoreuserknownhosts            = undef,
  $ipqos                           = undef,
  $kerberosauthentication          = undef,
  $kerberosorlocalpasswd           = undef,
  $kerberosticketcleanup           = undef,
  $kexalgorithms                   = undef,
  $keyregenerationinterval         = undef,
  $listenaddress                   = undef,
  $logingracetime                  = undef,
  $macs                            = undef,
  $maxauthtries                    = undef,
  $maxsessions                     = undef,
  $maxstartups                     = undef,
  $passwordauthentication          = undef,
  $permitemptypasswords            = undef,
  $permitopen                      = undef,
  $permitrootlogin                 = 'no',
  $permittunnel                    = undef,
  $permituserenvironment           = undef,
  $pidfile                         = undef,
  $port                            = '22',
  $printlastlog                    = undef,
  $printmotd                       = undef,
  $protocol                        = '2',
  $pubkeyacceptedkeytypes          = undef,
  $pubkeyauthentication            = undef,
  $rdomain                         = undef,
  $revokedkeys                     = undef,
  $rhostsrsaauthentication         = undef,
  $rsaauthentication               = undef,
  $saclsupport                     = undef,
  $serverkeybits                   = undef,
  $strictmodes                     = undef,
  $syslogfacility                  = 'AUTH',
  $tcpkeepalive                    = undef,
  $trustedusercakeys               = undef,
  $usedns                          = undef,
  $uselogin                        = undef,
  $usepam                          = undef,
  $versionaddendum                 = undef,
  $x11displayoffset                = undef,
  $x11forwarding                   = undef,
  $x11uselocalhost                 = undef,
  $xauthlocation                   = undef,

  $log_level                = 'INFO', # underscore here because puppet
  $has_pam                  = false,
  $has_gssapi               = false,
) {

  include ::ssh

  $valid_keywords = [
    'AcceptEnv',
    'AddressFamily',
    'AllowAgentForwarding',
    'AllowTcpForwarding',
    'AllowUsers',
    'AuthenticationMethods',
    'AuthorizedKeysCommand',
    'AuthorizedKeysCommandUser',
    'AuthorizedKeysFile',
    'AuthorizedPrincipalsFile',
    'Banner',
    'ChallengeResponseAuthentication',
    'ChrootDirectory',
    'Ciphers',
    'ClientAliveCountMax',
    'ClientAliveInterval',
    'Compression',
    'DenyGroups',
    'DenyUsers',
    'ForceCommand',
    'ExposeAuthInfo',
    'GatewayPorts',
    'GSSAPIAuthentication',
    'GSSAPIKeyExchange',
    'GSSAPICleanupCredentials',
    'GSSAPIStrictAcceptorCheck',
    'GSSAPIStoreCredentialsOnRekey',
    'HostbasedAuthentication',
    'HostbasedUsesNameFromPacketOnly',
    'HostCertificate',
    'HostKey',
    'HostKeyAlgorithms',
    'IgnoreRhosts',
    'IgnoreUserKnownHosts',
    'IPQoS',
    'KerberosAuthentication',
    'KerberosOrLocalPasswd',
    'KerberosTicketCleanup',
    'KexAlgorithms',
    'KeyRegenerationInterval',
    'ListenAddress',
    'LoginGraceTime',
    #'LogLevel',
    'MACs',
    'MaxAuthTries',
    'MaxSessions',
    'MaxStartups',
    'PasswordAuthentication',
    'PermitEmptyPasswords',
    'PermitOpen',
    'PermitRootLogin',
    'PermitTunnel',
    'PermitUserEnvironment',
    'PidFile',
    'Port',
    'PrintLastLog',
    'PrintMotd',
    'Protocol',
    'PubkeyAcceptedKeyTypes',
    'PubkeyAuthentication',
    'RDomain',
    'RevokedKeys',
    'RhostsRSAAuthentication',
    'RSAAuthentication',
    'SACLSupport',
    'ServerKeyBits',
    'StrictModes',
    'SyslogFacility',
    'TCPKeepAlive',
    'TrustedUserCAKeys',
    'UseDNS',
    'UseLogin',
    'UsePAM',
    'VersionAddendum',
    'X11DisplayOffset',
    'X11Forwarding',
    'X11UseLocalhost',
    'XAuthLocation',
  ]


  # Keywords that are joined by spaces in the presence of multiple
  # values
  $space_separated_keywords = [
    'AcceptEnv',
    'AuthorizedKeysFile',
    'DenyGroups',
    'DenyUsers',
  ]

  # Keywords that are configured with their own defined type.
  $defined_keywords = [
    'Match',
    'AllowGroups',
    'Subsystem',
  ]

  concat::fragment { 'sshd_config':
    order   => '10',
    target  => $ssh::sshd_config,
    content => template('ssh/sshd_config.erb'),
  }
}
