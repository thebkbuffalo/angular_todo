# $(document).ready ->
#   console.log "loaded"
#   if typeof __decorate != 'function'
#
#     __decorate = (decorators, target, key, desc) ->
#       if typeof Reflect == 'object' and typeof Reflect.decorate == 'function'
#         return Reflect.decorate(decorators, target, key, desc)
#       switch arguments.length
#         when 2
#           return decorators.reduceRight(((o, d) ->
#             d and d(o) or o
#           ), target)
#         when 3
#           return decorators.reduceRight(((o, d) ->
#             d and d(target, key)
#             undefined
#           ), undefined)
#         when 4
#           return decorators.reduceRight(((o, d) ->
#             d and d(target, key, o) or o
#           ), desc)
#       return
#
#   if typeof __metadata != 'function'
#
#     __metadata = (k, v) ->
#       if typeof Reflect == 'object' and typeof Reflect.metadata == 'function'
#         return Reflect.metadata(k, v)
#       return
#
#   #/ <reference path="typings/angular2/angular2.d.ts" />
#   angular2_1 = require('angular2/angular2')
#   store_1 = require('services/store')
#   ESC_KEY = 27
#   ENTER_KEY = 13
#   TodoApp = do ->
#     `var TodoApp`
#
#     TodoApp = ->
#       @todoStore = new (store_1.TodoStore)
#       return
#
#     TodoApp::stopEditing = (todo, editedTitle) ->
#       todo.setTitle editedTitle.value
#       todo.editing = false
#       return
#
#     TodoApp::cancelEditingTodo = (todo) ->
#       todo.editing = false
#       return
#
#     TodoApp::updateEditingTodo = (editedTitle, todo) ->
#       editedTitle = editedTitle.value.trim()
#       todo.editing = false
#       if editedTitle.length == 0
#         return @todoStore.remove(todo.uid)
#       todo.setTitle editedTitle
#       return
#
#     TodoApp::editTodo = (todo) ->
#       todo.editing = true
#       return
#
#     TodoApp::removeCompleted = ->
#       @todoStore.removeCompleted()
#       return
#
#     TodoApp::toggleCompletion = (uid) ->
#       @todoStore.toggleCompletion uid
#       return
#
#     TodoApp::remove = (uid) ->
#       @todoStore.remove uid
#       return
#
#     TodoApp::addTodo = ($event, newtodo) ->
#       if $event.which == ENTER_KEY and newtodo.value.trim().length
#         @todoStore.add newtodo.value
#         newtodo.value = ''
#       return
#
#     TodoApp = __decorate([
#       angular2_1.Component(selector: 'todo-app')
#       angular2_1.View(
#         directives: [
#           angular2_1.NgIf
#           angular2_1.NgFor
#         ]
#         template: '<section class="todoapp"><header class="header"><h1>todos</h1><input class="new-todo" placeholder="What needs to be done?" autofocus="" #newtodo (keyup)="addTodo($event, newtodo)"></header><section class="main" *ng-if="todoStore.todos.length > 0"><input class="toggle-all" type="checkbox" *ng-if="todoStore.todos.length" #toggleall [checked]="todoStore.allCompleted()" (click)="todoStore.setAllTo(toggleall)"><ul class="todo-list"><li *ng-for="#todo of todoStore.todos" [class.completed]="todo.completed" [class.editing]="todo.editing"><div class="view"><input class="toggle" type="checkbox" (click)="toggleCompletion(todo.uid)" [checked]="todo.completed"><label (dblclick)="editTodo(todo)">{{todo.title}}</label><button class="destroy" (click)="remove(todo.uid)"></button></div><input class="edit" *ng-if="todo.editing" [value]="todo.title" #editedtodo (blur)="stopEditing(todo, editedtodo)" (keyup.enter)="updateEditingTodo(editedtodo, todo)" (keyup.escape)="cancelEditingTodo(todo)"></li></ul></section><footer class="footer" *ng-if="todoStore.todos.length > 0"><span class="todo-count"><strong>{{todoStore.getRemaining().length}}</strong> {{todoStore.getRemaining().length == 1 ? \'item\' : \'items\'}} left</span><button class="clear-completed" *ng-if="todoStore.getCompleted().length > 0" (click)="removeCompleted()">Clear completed</button></footer></section>')
#       __metadata('design:paramtypes', [])
#     ], TodoApp)
#     TodoApp
#   angular2_1.bootstrap TodoApp
