FactoryBot.define do
  factory :task do
    name { 'test1' }
    association :user
  end
    # 作成するテストデータの名前を「second_task」とします
    # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    name  { 'test2' }
    association :user
  end
end
