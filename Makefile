build        :; ./build.sh
clean        :; dapp clean
test         :; ./test.sh $(match)
test-forge   :; ./test-forge.sh $(match)
deploy       :; make build && dapp create DssExecLib
flatten      :; hevm flatten --source-file "src/DssExecLib.sol" > out/DssExecLib-flat.sol
