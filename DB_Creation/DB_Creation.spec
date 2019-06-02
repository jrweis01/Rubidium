# -*- mode: python -*-

block_cipher = None


a = Analysis(['DB_Creation.py'],
             pathex=['F:\\PROJECTS\\PYTHON_PROJECTS\\DB_Creation'],
             binaries=[],
             datas=[],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='DB_Creation',
          debug=False,
          strip=False,
          upx=True,
          console=False , icon='ic_launcher_vUS_icon.ico')
