# say-fmt.pl
# perl 6
say 42.fmt('%+d')                # '+42'
say 42.fmt('%4d')                # '  42'
say 42.fmt('%04d')               # '0042'
say :16<1337f00d>.fmt('%X')      # '1337F00D'
