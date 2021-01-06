describe 'Matcher output' do
    it { expect{puts "Jacksin"}.to output.to_stdout }
    it { expect{print "Jacksin"}.to output("Jacksin").to_stdout }
    it { expect{puts "Jacksin pires"}.to output(/Jacksin/).to_stdout }

    it { expect{ warn "Jacksin"}.to output.to_stderr }
    it { expect{ warn "Jacksin"}.to output("Jacksin\n").to_stderr }
    it { expect{ warn "Jacksin pires"}.to output(/Jacksin/).to_stderr }
end