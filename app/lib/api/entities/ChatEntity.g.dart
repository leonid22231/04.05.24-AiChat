// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatEntity _$ChatEntityFromJson(Map<String, dynamic> json) => ChatEntity(
      id: json['id'] as String,
      model: $enumDecode(_$ChatModelEnumMap, json['model']),
      theme: $enumDecode(_$ChatThemeEnumMap, json['theme']),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatEntityToJson(ChatEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'theme': _$ChatThemeEnumMap[instance.theme]!,
      'model': _$ChatModelEnumMap[instance.model]!,
      'messages': instance.messages,
    };

const _$ChatModelEnumMap = {
  ChatModel.gpt_3: 'gpt_3',
  ChatModel.gpt_4: 'gpt_4',
};

const _$ChatThemeEnumMap = {
  ChatTheme.education_study: 'education_study',
  ChatTheme.education_science: 'education_science',
  ChatTheme.education_exams: 'education_exams',
  ChatTheme.social_content: 'social_content',
  ChatTheme.social_reals: 'social_reals',
  ChatTheme.social_facebook: 'social_facebook',
  ChatTheme.social_tiktok: 'social_tiktok',
  ChatTheme.social_linkedin: 'social_linkedin',
  ChatTheme.social_youtube: 'social_youtube',
  ChatTheme.social_social: 'social_social',
  ChatTheme.text_script: 'text_script',
  ChatTheme.text_rewrite: 'text_rewrite',
  ChatTheme.text_keyword: 'text_keyword',
  ChatTheme.text_checking: 'text_checking',
  ChatTheme.text_esse: 'text_esse',
  ChatTheme.market_analyzing: 'market_analyzing',
  ChatTheme.market_strategy: 'market_strategy',
  ChatTheme.market_content: 'market_content',
  ChatTheme.market_ads: 'market_ads',
  ChatTheme.market_faq: 'market_faq',
  ChatTheme.market_email: 'market_email',
  ChatTheme.business_starting: 'business_starting',
  ChatTheme.business_startup: 'business_startup',
  ChatTheme.business_plan: 'business_plan',
  ChatTheme.business_naming: 'business_naming',
  ChatTheme.business_model: 'business_model',
  ChatTheme.dev_mobile: 'dev_mobile',
  ChatTheme.deb_web: 'deb_web',
  ChatTheme.dev_edu: 'dev_edu',
  ChatTheme.dev_ui_ux: 'dev_ui_ux',
  ChatTheme.dev_passwords: 'dev_passwords',
  ChatTheme.health_fitness: 'health_fitness',
  ChatTheme.health_loose: 'health_loose',
  ChatTheme.health_mass: 'health_mass',
  ChatTheme.health_eat: 'health_eat',
  ChatTheme.health_power: 'health_power',
  ChatTheme.health_sleep: 'health_sleep',
  ChatTheme.health_calories: 'health_calories',
  ChatTheme.psy_psy: 'psy_psy',
  ChatTheme.psy_depression: 'psy_depression',
  ChatTheme.psy_happiness: 'psy_happiness',
  ChatTheme.psy_stress: 'psy_stress',
  ChatTheme.psy_assistant: 'psy_assistant',
  ChatTheme.med_sovet: 'med_sovet',
  ChatTheme.hobby_movie: 'hobby_movie',
  ChatTheme.hobby_game: 'hobby_game',
  ChatTheme.hobby_recipes: 'hobby_recipes',
  ChatTheme.hobby_songs: 'hobby_songs',
  ChatTheme.hobby_art: 'hobby_art',
  ChatTheme.travel_guid: 'travel_guid',
  ChatTheme.travel_info: 'travel_info',
  ChatTheme.travel_mark: 'travel_mark',
  ChatTheme.travel_tips: 'travel_tips',
  ChatTheme.finance_invest: 'finance_invest',
  ChatTheme.finance_plan: 'finance_plan',
  ChatTheme.work_summary: 'work_summary',
  ChatTheme.work_interview: 'work_interview',
  ChatTheme.work_naim: 'work_naim',
  ChatTheme.pravo_pdd: 'pravo_pdd',
  ChatTheme.pravo_admin: 'pravo_admin',
  ChatTheme.pravo_criminal: 'pravo_criminal',
  ChatTheme.pravo_ygolov: 'pravo_ygolov',
  ChatTheme.pravo_nalog: 'pravo_nalog',
  ChatTheme.more_assistant: 'more_assistant',
};
