import 'package:auth/entities/i_entity.dart';
import 'package:auth/services/translation/translation_type.dart';

abstract interface class ISettingsEntity implements IEntity {
  TranslationType get translationType;

  ISettingsEntity copyWith({
    TranslationType? translationType,
  });
}
