package net.marcesher;

/**
 * 
 * A simple class that does nothing but to let us know this should
 * be interpreted as a string
 *
 */
public class CFStrictTyperString {
	private String val;
	
	public CFStrictTyperString(String val) {
		this.val = val;
	}
	
	@Override
	public String toString() {
		return this.val;
	}
}