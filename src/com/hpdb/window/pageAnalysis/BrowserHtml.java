package com.hpdb.window.pageAnalysis;

import java.awt.BorderLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import chrriis.dj.nativeswing.swtimpl.components.JWebBrowser;

public class BrowserHtml extends JFrame{
	
	private JWebBrowser mWebBrowser = null;
	
	private JPanel webBrowserPanel = null;
	
	private JScrollPane scrollPane = null;
	
	/*public BrowserHtml(){
		super();
		
	}*/
	
	
	public BrowserHtml(){
	
		webBrowserPanel = new JPanel();
	
		webBrowserPanel.add(new JButton("加载"));
		scrollPane = new JScrollPane(webBrowserPanel); 
		getContentPane().add(scrollPane, BorderLayout.CENTER);
		setSize(1200, 1200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		setVisible(true);
		
	}
	public void b(String url){
            mWebBrowser = new JWebBrowser();
			mWebBrowser.navigate(url);
			mWebBrowser.setButtonBarVisible(false);
			mWebBrowser.setMenuBarVisible(false);
			mWebBrowser.setBarsVisible(false);
			mWebBrowser.setStatusBarVisible(false);
			webBrowserPanel.add(mWebBrowser, BorderLayout.CENTER);
	}
	
/*	
	public BrowserHtml(String url){
		mWebBrowser = new JWebBrowser();
		webBrowserPanel = new JPanel(new BorderLayout());
		mWebBrowser.navigate(url);
		mWebBrowser.setButtonBarVisible(false);
		mWebBrowser.setMenuBarVisible(false);
		mWebBrowser.setBarsVisible(false);
		mWebBrowser.setStatusBarVisible(false);
		webBrowserPanel.add(mWebBrowser, BorderLayout.CENTER);
	    
		webBrowserPanel = new JPanel();
		webBrowserPanel.add(new JButton("加载"));
		scrollPane = new JScrollPane(webBrowserPanel); 
		getContentPane().add(scrollPane, BorderLayout.CENTER);
		setSize(1200, 1200);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		setVisible(true);
		
	}*/
}
