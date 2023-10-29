action = "simulation"
sim_tool = "modelsim"
sim_top = "ALU_TOP_tb"

sim_post_cmd = "vsim -do ../vsim.do -c ALU_TOP_tb"

modules = {
    "local": ["../../test/ALU_TOP_tb"],
}
