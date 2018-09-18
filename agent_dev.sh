#!/bin/sh

M2_HOME=/opt/maven
M2_CONF_SETTINGS=$M2_HOME/repo/6.0/settings_10.2.001.xml

echo "Please select the following option."

options=("clean project 1" "build pom.xml offline 2" "build pom.xml 3" "build project offline 4" "build project 5" "build component offline 6" "build component 7" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "clean project 1")
            find . -name "pom.xml"  -exec rm -rf {} \
            mvn clean -Dinfa.platform=WIN64 -Dinfa.build_package=DEVEL -s $M2_CONF_SETTINGS
            ;;
        "build pom.xml offline 2")
            mvn component:generate-poms-promoted -Dinfa.platform=WIN64 -Dinfa.build_package=DEVEL -s $M2_CONF_SETTINGS -o
            ;;
        "build pom.xml 3")
            mvn component:generate-poms-promoted -Dinfa.platform=WIN64 -Dinfa.build_package=DEVEL -s $M2_CONF_SETTINGS
            ;;          
        "build project offline 4")
            mvn install -Dinfa.platform=Linux.64 -Dinfa.build_package=DEVEL -s $M2_CONF_SETTINGS 
            ;;
        "build project 5")
             mvn install -Dinfa.platform=Linux.64 -Dinfa.build_package=DEVEL -s $M2_CONF_SETTINGS -o
            ;;    
        "build component offline 6")
            mvn eclipse:clean component:eclipse  -Dinfa.platform=Linux.64 -Dinfa.build_package=DEVEL -DskipRenaming=true  -s $M2_CONF_SETTINGS -o
            ;;
        "build component 7")
            mvn eclipse:clean component:eclipse  -Dinfa.platform=Linux.64 -Dinfa.build_package=DEVEL -DskipRenaming=true  -s $M2_CONF_SETTINGS
            ;;    
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done