# Change the settings below to match your design:
# ------------------------------------------------
set TOP_LEVEL_CELL     tt_um_maxluppe_ttsky26a_analog
# set TOP_LEVEL_CELL     ttsky26a_analog

# Save the layout and export GDS/LEF
# ----------------------------------
save ${TOP_LEVEL_CELL}.mag
# file mkdir ../gds
gds write ../gds/${TOP_LEVEL_CELL}.gds
# file mkdir ../lef
lef write ../lef/${TOP_LEVEL_CELL}.lef -hide -pinonly
#CELL position 49.18 184.46
