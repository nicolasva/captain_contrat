require 'test_helper'

class HerosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hero = heros(:one)
    @hero2 = heros(:two)
  end

  let(:valid_attributes) {
  {
    name: "my hero",
    health: 1,
    attack: 1,
    speed: 5,
    dodge_rate: 0,
    power: 1,
    rank: 1
  }

  let(:valid_attributes2) {
    name: "my hero2"
    health: 2
    attack: 2
    speed: 4
    dodge_rate: 0
    critical_rate: 0
    power: 1
    rank: 1
  }


  let(:post) {
    Hero.create! valid_attributes
  }

  test "should get new" do
    get new_hero_url
    assert_response :success
  end

  #test "should create hero" do
  #  assert_difference('Hero.count') do
  #    post heros_url, params: { hero: {  } }
  #  end

  #  assert_redirected_to hero_url(Hero.last)
  #end
  describe "POST #create" do
    context "with valid params" do
      before do 
        post :create, params: {post: valid_attributes}
      end

      it "assigns a newly created post as Hero" do
        expect(assigns(:post)).to be_a(Hero)
        expect(assigns(:post)).to be_persisted
        expect(Hero.count).to eq(1)
      end

      it "redirects to the created post" do
        expect(response).to redirect_to(Hero.last)
      end
    end
  end

  test "should show hero" do
    get hero_url(@hero)
    assert_response :success
  end

  test "should get edit" do
    get edit_hero_url(@hero)
    assert_response :success
  end

  describe 'PUT /update' do
    test "should update hero" do
      put hero_url(@hero), params: { hero: { valid_attributes2 } }
      @contact.firstname.should eq("Larry")
      assert_redirected_to hero_url(@hero2)
    end
  end

end
