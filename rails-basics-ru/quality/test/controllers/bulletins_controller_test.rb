# frozen_string_literal: true

require 'test_helper'
class BulletinsControllerTest < ActionDispatch::IntegrationTest
  self.use_transactional_tests = true
  test 'opens bulletins' do
    get bulletins_url
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'opens one bulletin' do
    bulletin = bulletins :bulletin1
    get bulletin_path bulletin

    assert_response :success
    assert_select 'h1', 'Bull1'
    assert_select 'p', 'Bull1_body'
  end
end
