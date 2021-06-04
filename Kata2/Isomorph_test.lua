lu = require("luaunit")
require("IsomorphProgram")

function TestIsmorphTrue()
    lu.assertEquals(AreIsomorph("aab", "xxy"), true)
end

function TestIsmorphFalse()
    lu.assertEquals(AreIsomorph("humus", "aguas"), false)
end

function TestIsmorphError()
    lu.assertErrorMsgContains("las palabras deben de ser de la misma longitud", AreIsomorph, "humus", "ferrocarril")
end

os.exit(lu.LuaUnit.run())