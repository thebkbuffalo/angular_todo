if typeof __decorate != 'function'

  __decorate = (decorators, target, key, desc) ->
    if typeof Reflect == 'object' and typeof Reflect.decorate == 'function'
      return Reflect.decorate(decorators, target, key, desc)
    switch arguments.length
      when 2
        return decorators.reduceRight(((o, d) ->
          d and d(o) or o
        ), target)
      when 3
        return decorators.reduceRight(((o, d) ->
          d and d(target, key)
          undefined
        ), undefined)
      when 4
        return decorators.reduceRight(((o, d) ->
          d and d(target, key, o) or o
        ), desc)
    return

if typeof __metadata != 'function'

  __metadata = (k, v) ->
    if typeof Reflect == 'object' and typeof Reflect.metadata == 'function'
      return Reflect.metadata(k, v)
    return

#/ <reference path="typings/angular2/angular2.d.ts" />
angular2_1 = require('angular2/angular2')
store_1 = require('services/store')
ESC_KEY = 27
ENTER_KEY = 13
TodoApp = do ->
  `var TodoApp`

  TodoApp = ->
    @todoStore = new (store_1.TodoStore)
    return

  TodoApp::stopEditing = (todo, editedTitle) ->
    todo.setTitle editedTitle.value
    todo.editing = false
    return

  TodoApp::cancelEditingTodo = (todo) ->
    todo.editing = false
    return

  TodoApp::updateEditingTodo = (editedTitle, todo) ->
    editedTitle = editedTitle.value.trim()
    todo.editing = false
    if editedTitle.length == 0
      return @todoStore.remove(todo.uid)
    todo.setTitle editedTitle
    return

  TodoApp::editTodo = (todo) ->
    todo.editing = true
    return

  TodoApp::removeCompleted = ->
    @todoStore.removeCompleted()
    return

  TodoApp::toggleCompletion = (uid) ->
    @todoStore.toggleCompletion uid
    return

  TodoApp::remove = (uid) ->
    @todoStore.remove uid
    return

  TodoApp::addTodo = ($event, newtodo) ->
    if $event.which == ENTER_KEY and newtodo.value.trim().length
      @todoStore.add newtodo.value
      newtodo.value = ''
    return

  TodoApp = __decorate([
    angular2_1.Component(selector: 'todo-app')
    angular2_1.View(
      directives: [
        angular2_1.NgIf
        angular2_1.NgFor
      ]
      template: '\n\u9\u9<section class="todoapp">\n\u9\u9\u9<header class="header">\n\u9\u9\u9\u9<h1>todos</h1>\n\u9\u9\u9\u9<input class="new-todo" placeholder="What needs to be done?" autofocus="" #newtodo (keyup)="addTodo($event, newtodo)">\n\u9\u9\u9</header>\n\u9\u9\u9<section class="main" *ng-if="todoStore.todos.length > 0">\n\u9\u9\u9\u9<input class="toggle-all" type="checkbox" *ng-if="todoStore.todos.length" #toggleall [checked]="todoStore.allCompleted()" (click)="todoStore.setAllTo(toggleall)">\n\u9\u9\u9\u9<ul class="todo-list">\n\u9\u9\u9\u9\u9<li *ng-for="#todo of todoStore.todos" [class.completed]="todo.completed" [class.editing]="todo.editing">\n\u9\u9\u9\u9\u9\u9<div class="view">\n\u9\u9\u9\u9\u9\u9\u9<input class="toggle" type="checkbox" (click)="toggleCompletion(todo.uid)" [checked]="todo.completed">\n\u9\u9\u9\u9\u9\u9\u9<label (dblclick)="editTodo(todo)">{{todo.title}}</label>\n\u9\u9\u9\u9\u9\u9\u9<button class="destroy" (click)="remove(todo.uid)"></button>\n\u9\u9\u9\u9\u9\u9</div>\n\u9\u9\u9\u9\u9\u9<input class="edit" *ng-if="todo.editing" [value]="todo.title" #editedtodo (blur)="stopEditing(todo, editedtodo)" (keyup.enter)="updateEditingTodo(editedtodo, todo)" (keyup.escape)="cancelEditingTodo(todo)">\n\u9\u9\u9\u9\u9</li>\n\u9\u9\u9\u9</ul>\n\u9\u9\u9</section>\n\u9\u9\u9<footer class="footer" *ng-if="todoStore.todos.length > 0">\n\u9\u9\u9\u9<span class="todo-count"><strong>{{todoStore.getRemaining().length}}</strong> {{todoStore.getRemaining().length == 1 ? \'item\' : \'items\'}} left</span>\n\u9\u9\u9\u9<button class="clear-completed" *ng-if="todoStore.getCompleted().length > 0" (click)="removeCompleted()">Clear completed</button>\n\u9\u9\u9</footer>\n\u9\u9</section>')
    __metadata('design:paramtypes', [])
  ], TodoApp)
  TodoApp
angular2_1.bootstrap TodoApp

# ---
# generated by js2coffee 2.1.0
