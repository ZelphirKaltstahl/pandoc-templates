# Reset
Color_Off='\033[0m'       # Text Reset

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

HIGHLIGHT_COLOR="${BIYellow}"
MESSAGE_COLOR="${BIBlue}"
ERROR_COLOR="${BIRed}"
WARNING_COLOR="${BIYellow}"
NO_COLOR="${Color_Off}"
SUCCESS_COLOR="${BIGreen}"

echo -e "${MESSAGE_COLOR}Compiling PDFs ...${NO_COLOR}"

##########
# GERMAN #
##########

pandoc \
--read=markdown+footnotes+grid_tables+multiline_tables+fancy_lists+startnum+definition_lists \
--table-of-contents \
--toc-depth=2 \
--preserve-tabs \
--chapters \
--standalone \
--template=template-book-en.latex \
--latex-engine=xelatex \
ud-st101.md \
-o ud-st101.pdf

if [ $? -eq 0 ]; then
	echo -e "${SUCCESS_COLOR}Successfully${NO_COLOR} compiled ${HIGHLIGHT_COLOR}ud-st101.pdf${NO_COLOR}"
else
	echo -e "${ERROR_COLOR}Failed${NO_COLOR} to create ${HIGHLIGHT_COLOR}ud-st101.pdf${NO_COLOR}"
	exit 1
fi
