RSpec::Matchers.define_negated_matcher :exclude, :include

describe Array.new([1,2,3]), "(um array)", collection: true  do
    it '#include' do
        expect(subject).to include(2)
        expect(subject).to exclude(10)
    end

    it '#contain_exactly' do
        expect(subject).to contain_exactly(2,3,1) #inclui esses números, não necessáriamente em ordem
    end

    it '#match_array' do
        expect(subject).to match_array([1,2,3]) #precisa ser igual
    end
end