-- Reactor Monitor for BigReactors + OpenComputers
-- By viveleroi 2015

local version = 0.1
local upper = 0.95 --Upper limit for computer to stop transmitting redstone signal. 0.90=90% full.
local lower = 0.20 --Lower limit for computer to start transmitting redstone signal.

print("Reactor/Capacitor Manager v"..version)

local shell = require("shell")
local component = require("component")
local gpu = component.gpu
local br = component.br_reactor

while true do
    -- check energy
    eNow = br.getEnergyStored()
    eMax = 10000000; -- default
    fill = (eNow / eMax)

    if fill > upper then
        br.setActive(false)
    elseif fill < lower then
        br.setActive(true)
    end

    shell.execute("sleep 1")
end

print("Running... turn off comp to stop")