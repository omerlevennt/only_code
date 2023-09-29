import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:only_code/speed_code/todo_app/service_manager.dart';
import 'package:only_code/speed_code/todo_app/todo_model.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  late final ITodoService todoService;
  List<TodoModel>? _todoItem;
  bool _isLoading = false;

  void _chaceLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    todoService = TodoService();
    fetchTodoItems();
  }

  Future<void> fetchTodoItems() async {
    _chaceLoading();
    _todoItem = await todoService.fetchTodoItems();
    _chaceLoading();
  }

  static const _imageUrl = 'https://randomuser.me/api/portraits/men/34.jpg';
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.blackColor,
        onPressed: () {
          _animateToStart();
        },
        child: const Icon(Icons.arrow_upward),
      ),
      appBar: _AppBar(
        imageUrl: _imageUrl,
        isLoading: _isLoading,
      ),
      body: Padding(
        padding: AppPadding.symmetricHorizontalLow,
        child: _todoItem == null
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView(
                controller: _scrollController,
                children: [
                  const _Header(),
                  const _SearchTextField(),
                  const _CardTitle(),
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: _todoItem?.length,
                    itemBuilder: (context, index) {
                      return _TodoCard(model: _todoItem?[index]);
                    },
                  )
                ],
              ),
      ),
    );
  }

  void _animateToStart() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }
}

class _TodoCard extends StatelessWidget {
  const _TodoCard({
    required TodoModel? model,
  }) : _model = model;

  final TodoModel? _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.onlyRightLow,
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        child: ListTile(
            minLeadingWidth: AppSize.minLeadingWidth,
            leading: Text('${_model?.id ?? ''}'),
            title: Text(
              _model?.title ?? '',
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton.outlined(
              onPressed: () {},
              icon: Icon(
                Icons.add_task_sharp,
                color: _model?.completed == false ? Colors.red : Colors.green,
              ),
            )),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        "Recent Task ",
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      cursorColor: AppColor.blackColor,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      obscureText: false,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColor.greyColor,
        suffixIconColor: AppColor.blackColor,
        suffixIcon: IconButton(
            onPressed: () {}, icon: const Icon(Icons.filter_list_outlined)),
        hintText: "Search Task...",
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: AppColor.greyColor.withOpacity(0.4),
        focusColor: AppColor.blackColor,
      ),
      onChanged: (value) {},
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        "Search\nYour Task ",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    required String imageUrl,
    required bool isLoading,
  })  : _imageUrl = imageUrl,
        _isLoading = isLoading;

  final String _imageUrl;
  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: AppSize.kElevation,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: const TextStyle(
          color: AppColor.blackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold),
      title: const Text(
        AppKeys.todo,
      ),
      leadingWidth: AppSize.kLeadingWidth,
      leading: Padding(
        padding: AppPadding.onlyLeftLow,
        child: CircleAvatar(
          backgroundColor: AppColor.greyColor,
          backgroundImage: NetworkImage(_imageUrl),
        ),
      ),
      actionsIconTheme: const IconThemeData(color: AppColor.blackColor),
      actions: [
        Padding(
          padding: AppPadding.onlyRightLow,
          child: IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_active)),
        ),
        _isLoading
            ? const CircularProgressIndicator.adaptive()
            : const SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

@immutable
final class AppColor {
  const AppColor._();
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;
}

@immutable
final class AppSize {
  const AppSize._();
  static const double kLeadingWidth = 80;
  static const double kElevation = 0;
  static const double minLeadingWidth = 20;
}

@immutable
final class AppKeys {
  const AppKeys._();
  static const String todo = 'ToDo';
}

@immutable
final class AppPadding {
  const AppPadding._();
  static const EdgeInsets onlyRightLow = EdgeInsets.only(right: 8.0);
  static const EdgeInsets onlyLeftLow = EdgeInsets.only(left: 8.0);
  static const EdgeInsets symmetricHorizontalLow =
      EdgeInsets.symmetric(horizontal: 16.0);
}
