return {
  cmd = {'pylsp'},
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {
                        'E261',
                        'E302',
                        'E305', -- Expected 2 lines after definition...
                        'E241', -- multiple spaces after ','
                    },
          maxLineLength = 120 -- XD
        }
      }
    }
  }
}
