import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero.dart';
import 'package:angular_router/angular_router.dart';
import 'hero_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-hero',
  directives: [coreDirectives, formDirectives],
  styleUrls: ['hero_component.css'],
  templateUrl: 'hero_component.html',
)
class HeroComponent implements OnActivate {
  final HeroService _heroService;
  final Location _location;
  Hero hero;
  HeroComponent(this._heroService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroService.get(id));
  }

  void goBack() => _location.back();
}
