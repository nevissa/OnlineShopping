package net.kzn.onlineshopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.kzn.onlineshopping.service.CartService;
import net.kzn.shoppingbackend.dao.UserDAO;
import net.kzn.shoppingbackend.dto.Category;
import net.kzn.shoppingbackend.dto.User;

@Controller
@RequestMapping("/user")
public class UserController {

	private final static Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private CartService cartService;
	private UserDAO userDao;
	
	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Shopping Cart");
		mv.addObject("userClickShowCart", true);
		
		if(result!=null) {
			switch(result) {
				case "added":
					mv.addObject("message", "Product has been successfully added inside cart!");					
					cartService.validateCartLine();
					break;
				case "unavailable":
					mv.addObject("message", "Product quantity is not available!");					
					break;
				case "updated":
					mv.addObject("message", "Cart has been updated successfully!");					
					cartService.validateCartLine();
					break;
				case "modified":
					mv.addObject("message", "One or more items inside cart has been modified!");
					break;
				case "maximum":
					mv.addObject("message", "Maximum limit for the item has been reached!");
					break;
				case "deleted":
					mv.addObject("message", "CartLine has been successfully removed!");
					break;

			}
		}
		else {
			String response = cartService.validateCartLine();
			if(response.equals("result=modified")) {
				mv.addObject("message", "One or more items inside cart has been modified!");
			}
		}

		mv.addObject("cartLines", cartService.getCartLines());
		return mv;
		
	}
	
	@ModelAttribute("user")
	public User modelCategory() {
		return new User();
	}
	
	
	 @GetMapping("/")
	    public String login() {
	        return "/acesso/login";
	    }

	
@RequestMapping(value = "/profil", method=RequestMethod.POST)
public String submit(@Valid @ModelAttribute("user")User user, 
	      BindingResult result, ModelMap model) {
	        if (result.hasErrors()) {
	            return "error";
	        }
	        model.addAttribute("role", user.getRole());
	          return "profilView";
	    }
	

	
	
	
	
	
	
	
	
	
	

	@RequestMapping("/{cartLineId}/update")
	public String udpateCartLine(@PathVariable int cartLineId, @RequestParam int count) {
		String response = cartService.manageCartLine(cartLineId, count);		
		return "redirect:/cart/show?"+response;		
	}
	
	@RequestMapping(value = "/new_user", method=RequestMethod.POST)
	public String managePostCategory(@Valid @ModelAttribute("user")User user, HttpServletRequest request) {					

	        userDao.add(user);
	 
		 
			return "redirect:" + request.getHeader("Referer") ;

	}

	@ModelAttribute("user")
	public User modelCateg() {
		return new User();
	}
	
	@RequestMapping("/add/{productId}/product")
	public String addCartLine(@PathVariable int productId) {
		String response = cartService.addCartLine(productId);
		return "redirect:/cart/show?"+response;
	}
	
	@RequestMapping("/{cartLineId}/remove")
	public String removeCartLine(@PathVariable int cartLineId) {
		String response = cartService.removeCartLine(cartLineId);
		return "redirect:/cart/show?"+response;
	}
	
	/* after validating it redirect to checkout
	 * if result received is success proceed to checkout 
	 * else display the message to the user about the changes in cart page
	 * */	
	@RequestMapping("/validate")
	public String validateCart() {	
		String response = cartService.validateCartLine();
		if(!response.equals("result=success")) {
			return "redirect:/cart/show?"+response;
		}
		else {
			return "redirect:/cart/checkout";
		}
	}	
}
