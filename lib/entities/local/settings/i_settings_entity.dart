import 'package:auth/entities/i_entity.dart';
import 'package:auth/services/translation/translation_type.dart';

abstract interface class ISettingsEntity implements IEntity {
  int get id;
  TranslationType get translationType;

  ISettingsEntity copyWith({
    int? id,
    TranslationType? translationType,
  });
}
