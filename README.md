TestPlan Manager

Aplikacja mobilna do zarządzania planami testowymi, zintegrowana z Microsoft Lists. Projekt skupia się na implementacji Clean Architecture oraz pracy w trybie offline.

Opis techniczny: Aplikacja została zbudowana w oparciu o podział na warstwy (Presentation, Domain, Data), co zapewnia separację logiki biznesowej od UI i źródeł danych. Komunikacja z API Microsoft Lists odbywa się poprzez REST, a pobrane dane są cache'owane w lokalnej bazie danych, co umożliwia pełną funkcjonalność bez dostępu do sieci.

Wykorzystane technologie i wzorce:

Flutter & Dart

Clean Architecture – pełna separacja warstw.

State Management – BLoC / Cubit do zarządzania stanem aplikacji.

Code Generation – freezed do generowania niemutowalnych modeli i stanów (Unions) oraz json_serializable do deserializacji danych z API.

API Integration – obsługa REST API Microsoft Lists (autoryzacja, parsowanie JSON).

Offline Data – lokalna baza danych służąca jako cache dla danych zewnętrznych.
