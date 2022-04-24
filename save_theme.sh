#!/bin/sh

echo "#!/bin/sh" >new_theme.sh
echo "gsettings set org.gnome.desktop.background picture-uri" `gsettings get org.gnome.desktop.background picture-uri` >> new_theme.sh
echo "gsettings set org.gnome.desktop.interface gtk-theme" `gsettings get org.gnome.desktop.interface gtk-theme` >> new_theme.sh
echo "gsettings set org.gnome.desktop.interface icon-theme" `gsettings get org.gnome.desktop.interface icon-theme` >> new_theme.sh
echo "gsettings set org.gnome.shell.extensions.user-theme name" `gsettings get org.gnome.shell.extensions.user-theme name` >> new_theme.sh
echo "gsettings set org.gnome.desktop.interface cursor-theme" `gsettings get org.gnome.desktop.interface cursor-theme` >> new_theme.sh

gxmessage -buttons "Light:1,Dark:2" "Is it a light or dark theme?"
ans=$?
if [ $ans -eq 1 ]; then
      echo "dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-color \"'rgb(255,255,255)'\"" >> new_theme.sh
  echo "dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/foreground-color \"'rgb(0,0,0)'\"" >> new_theme.sh
  echo "gsettings set org.gnome.gedit.preferences.editor scheme kate" >> new_theme.sh
fi

if [ $ans -eq 2 ]; then
      echo "dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-color \"'rgb(0,0,0)'\"" >> new_theme.sh
  echo "dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/foreground-color \"'rgb(0,255,0)'\"" >> new_theme.sh
  echo "gsettings set org.gnome.gedit.preferences.editor scheme oblivion" >> new_theme.sh
fi

chmod +x new_theme.sh
