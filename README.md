# linux-stuffs
Just a repo with some of the stuffs I found useful
* **en_BD**(custom-locale/en_BD) is a custom locale made from editing en_US that might be helpful for Bangladeshi Linux users who are used to a week starting from saturday and friday as weekly holiday. There are also some minor modifications (like using dd/mm/yyyy format, 12 hour clock, metric system etc)

* **zoin** is a script to organize my zoom meeting scheduling. Just put meeting id, password and other information in joinzoom file (in right place; space separated) and you are good to go. If a class gets cancelled just put a `!` before the course name.
    - Setup
    
      Just put the `joinzoom` in `$XDG_CONFIG_HOME` (`~/.config/` directory for most of the time)
    - Usage
    
      ```
      zoin <serial no>
      ```
    - Example
    
      If you are going to join the 3rd class of a day
      ```
      zoin 3
      ```
 
* **record.sh**(screen-record/record.sh) is only here to intensify your linux ego; lets you flex on people that you are man enough to avoid obs, bandicam, camtasia and what not, yet record screen in style. I have written this script focusing on recording online classes. Please be sure to edit the output file directory. \[Warning: you might need to use pavucontrol if you wish to switch audio output device while recording]
