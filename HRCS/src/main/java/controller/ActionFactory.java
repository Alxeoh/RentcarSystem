package controller;

import contoller.action.AddAction;
import contoller.action.LoginAction;
import contoller.action.LogoutAction;
import contoller.action.ModifyAction;
import contoller.action.RegistAction;
import contoller.action.WriteAction;

public class ActionFactory {

		private ActionFactory() {}
		
		private static ActionFactory instance = new ActionFactory();
		
		public static ActionFactory getInstance() {
			return instance;
		}
		
		public Action getAction(String command) {
			Action action = null;
			
			if(command.equals("regist")) {
				action = new RegistAction();
			} else if(command.equals("login")){
				action = new LoginAction();
			} else if(command.equals("logout")){
				action = new LogoutAction();
			} else if(command.equals("modify")) {
				action = new ModifyAction();
			} else if(command.equals("add")) {
				action = new AddAction();
			} else if(command.equals("write")) {
				action = new WriteAction();
			}
			return action;
		}
}
